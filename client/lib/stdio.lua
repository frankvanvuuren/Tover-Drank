 require("love.event")
 local view = require("lib.fennelview") local event, channel = ...









































































 if channel then local prompt = nil local function _0_(next_line_3f) local function _1_() if next_line_3f then return ".." else return ">> " end end io.write(_1_()) io.flush() return (io.read() .. "\n") end prompt = _0_ local function looper(input) if input then love.event.push(event, input) local output = channel:demand() local next_line = (output[2] and ("next-line" == output[2])) if next_line then elseif (output[2] and ("Error:" == output[2])) then print(view(output)) else for _, ret in ipairs(output) do print(ret) end end io.flush() return looper(prompt(next_line)) end end looper(prompt()) end local function start_repl() local code = love.filesystem.read("lib/stdio.fnl") local luac = nil if code then luac = love.filesystem.newFileData(fennel.compileString(code), "io") else luac = love.filesystem.read("lib/stdio.lua") end local thread = love.thread.newThread(luac) local io_channel = love.thread.newChannel() local coro = coroutine.create(fennel.repl) local out = nil local function _2_(val) return io_channel:push(val) end out = _2_ local options = nil local function _3_(kind, ...) return out({kind, "Error:", ...}) end local function _4_(parser_state) if (parser_state["stack-size"] > 0) then io_channel:push({"next-line", "next-line"}) end return coroutine.yield() end options = {moduleName = "lib.fennel", onError = _3_, onValues = out, pp = view, readChunk = _4_} coroutine.resume(coro, options) thread:start("eval", io_channel) local function _5_(input) return coroutine.resume(coro, input) end love.handlers.eval = _5_ return nil end return {start = start_repl}
