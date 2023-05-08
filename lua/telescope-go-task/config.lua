local config = {}

config.defaults = {
	task_bin = "task", -- custom task binary, sometimes called `go-task`
}

setmetatable(config, { __index = config.defaults })

return config
