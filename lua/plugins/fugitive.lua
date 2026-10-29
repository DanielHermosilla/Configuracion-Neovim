-- Take code from another ref into the working tree, hunk by hunk.
-- The "source ref" (the branch/tag/commit you take code from) is chosen once
-- per repository and remembered across sessions.
local store = vim.fn.stdpath("data") .. "/source-ref.json"

local function load()
	local ok, data = pcall(function()
		return vim.json.decode(table.concat(vim.fn.readfile(store), "\n"))
	end)
	return ok and type(data) == "table" and data or {}
end

local function save(data)
	vim.fn.writefile({ vim.json.encode(data) }, store)
end

local function repo_root()
	local root = vim.fn.exists("*FugitiveWorkTree") == 1 and vim.fn.FugitiveWorkTree() or ""
	if root == "" then
		root = vim.fn.systemlist({ "git", "rev-parse", "--show-toplevel" })[1] or ""
		if vim.v.shell_error ~= 0 then
			root = ""
		end
	end
	return root
end

local function pick_ref(root, on_done)
	local refs = vim.fn.systemlist({
		"git",
		"-C",
		root,
		"for-each-ref",
		"--format=%(refname:short)",
		"refs/heads",
		"refs/remotes",
		"refs/tags",
	})
	vim.ui.select(refs, { prompt = "Source ref for " .. vim.fn.fnamemodify(root, ":t") }, function(ref)
		if not ref then
			return
		end
		local data = load()
		data[root] = ref
		save(data)
		vim.notify("Source ref: " .. ref)
		if on_done then
			on_done(ref)
		end
	end)
end

-- Run fn(ref) with this repository's source ref, asking for it the first time.
local function with_ref(fn)
	local root = repo_root()
	if root == "" then
		return vim.notify("Not in a git repository", vim.log.levels.WARN)
	end
	local ref = load()[root]
	if ref then
		fn(ref)
	else
		pick_ref(root, fn)
	end
end

local function cmd(fmt)
	return function()
		with_ref(function(ref)
			vim.cmd(fmt:format(ref))
		end)
	end
end

vim.api.nvim_create_user_command("SourceRef", function(o)
	local root = repo_root()
	if root == "" then
		return
	end
	if o.args ~= "" then
		local data = load()
		data[root] = o.args
		save(data)
		vim.notify("Source ref: " .. o.args)
	else
		pick_ref(root)
	end
end, { nargs = "?", desc = "Set the source ref of this repository" })

return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gread", "Gwrite", "Gclog" },
		keys = {
			{ "<leader>mS", "<cmd>SourceRef<cr>", desc = "Set source ref" },
			{ "<leader>mm", cmd("Gvdiffsplit %s"), desc = "Diff file vs source ref" },
			{ "<leader>mo", cmd("Gedit %s:%%"), desc = "Open source-ref version" },
			{ "<leader>mR", cmd("Gread %s:%%"), desc = "Read whole file from source ref" },
			{ "<leader>md", cmd("DiffviewOpen %s"), desc = "Diffview: all that differs" },
			{ "<leader>mD", cmd("DiffviewOpen %s -- %%"), desc = "Diffview: this file" },
			{ "<leader>mb", "<cmd>Git blame<cr>", desc = "Blame (fugitive)" },
			{ "<leader>ms", "<cmd>Git<cr>", desc = "Fugitive status" },
			{ "<leader>ma", "<cmd>diffget<cr>", desc = "Accept hunk" },
			{ "<leader>ma", ":diffget<cr>", mode = "v", desc = "Accept selected lines" },
			{ "<leader>mp", "<cmd>diffput<cr>", desc = "Put hunk" },
			{ "<leader>mp", ":diffput<cr>", mode = "v", desc = "Put selected lines" },
		},
	},
}
