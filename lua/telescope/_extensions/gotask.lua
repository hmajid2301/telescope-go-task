local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local utils = require("telescope.utils")
local sorters = require("telescope.sorters")
local make_entry = require("telescope.make_entry")
local api = vim.api
local conf = require("telescope.config").values
local has_plenary, Job = pcall(require, "plenary.job")

local stdout, ret = Job:new({
	command = "go-task",
	args = { "--list-all" },
}):sync()

local colors = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = finders.new_table({
				results = stdout,
			}),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

colors()
