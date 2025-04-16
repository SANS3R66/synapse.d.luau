-- closures
declare function checkcaller(): boolean
declare function clonefunction<A..., R...>(functionToClone: (A...) -> R...): ((A...) -> R...)
declare function getfunctionhash(functionToHash: (...any) -> (...any)): string
declare function hookfunction<A1..., R1...>(functionToHook: (A1...) -> R1..., hook: (A1...) -> R1...): ((A1...) -> R1...)
declare function hookmetamethod(object: any, metamethodName: string, hook: (...any) -> (...any)): (...any) -> (...any)
declare function iscclosure(func: (...any) -> (...any)): boolean
declare function isexecutorclosure(func: (...any) -> (...any)): boolean
declare function islclosure(func: (...any) -> (...any)): boolean
declare function newcclosure<A..., R...>(functionToWrap: (A...) -> R...): ((A...) -> R...)
-- cryptography 
declare crypt: {
    base64decode: (data: string) -> string,
    base64encode: (data: string) -> string
}
-- debug
declare debug: {
    getconstant: (func: (...any) -> (...any) | number, index: number) -> number | string | boolean | nil,
    getconstants: (func: (...any) -> (...any) | number) -> { number | string | boolean | nil },
    getproto: (func: (...any) -> (...any) | number, index: number, activated: boolean?) -> (...any) -> (...any) | { (...any) -> (...any) },
    getprotos: (func: (...any) -> (...any) | number) -> { (...any) -> (...any) },
    getstack: (level: number, index: number?) -> any | { any },
    getupvalue: (func: (...any) -> (...any) | number, index: number) -> any,
    getupvalues: (func: (...any) -> (...any) | number) -> { any },
    setconstant: (func: (...any) -> (...any) | number, index: number, value: number | string | boolean | nil) -> (),
    setstack: (level: number, index: number, value: any) -> (),
    setupvalue: (func: (...any) -> (...any) | number, index: number, value: any) -> ()
}
-- drawing TODO (those who drawing lib in big 2025)
-- env
declare function getgc(includeTables: boolean?): { { any } | (...any) -> (...any) }
declare function getgenv(): { [any]: any }
declare function getrenv(): { [any]: any }
type FunctionFilterOptions = {
    Name: string?,
    IgnoreExecutor: boolean?,
    Hash: string?,
    Constants: {any}?,
    Upvalues: {any}?
}
type TableFilterOptions = {
    Keys: {any}?,
    Values: {any}?,
    KeyValuePairs: { [any]: any }?,
    Metatable: { [any]: any }?
}
declare function filtergc(
    filterType: "function" | "table",
    filterOptions: FunctionFilterOptions | TableFilterOptions,
    returnOne: boolean
): ((...any) -> (...any) | { [any]: any } | { (...any) -> (...any) | { [any]: any } })
-- filesystem
declare function appendfile(path: string, contents: string): ()
declare function delfile(path: string): ()
declare function delfolder(path: string): ()
declare function getcustomasset(path: string): string
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function listfiles(path: string): { string }
declare function loadfile(path: string): (...any) -> ...any
declare function makefolder(path: string): ()
declare function readfile(path: string): string
declare function writefile(path: string, data: string): ()
-- instances
declare function cloneref<T>(object: T & Instance): T
declare function fireclickdetector(detector: ClickDetector, distance: number?, event: string?): ()
declare function fireproximityprompt(prompt: ProximityPrompt): ()
declare function firetouchinterest(part1: BasePart, part2: BasePart, toggle: boolean | number): ()
declare function getcallbackvalue(object: Instance, property: string): ((...any) -> (...any) | nil)
declare function gethui(): ScreenGui
declare function getinstances(): { Instance }
declare function getnilinstances(): { Instance }
declare function getrawmetatable(object: any): { [any]: any } | nil
declare function isreadonly(table: { any }): boolean
declare function setrawmetatable<T>(object: T & ({ any }), metatable: { any }): (T)
declare function setreadonly(table: { any }, state: boolean): ()
declare function getnamecallmethod(): string
-- misc
declare function identifyexecutor(): (string, string)
type RequestOptions = {
    Url: string,
    Method: "GET" | "POST" | "PUT" | "PATCH" | "DELETE",
    Body: string?,
    Headers: { [string]: string }?,
    Cookies: { [string]: string }?
}

type Response = {
    Body: string,
    StatusCode: number,
    StatusMessage: string,
    Success: boolean,
    Headers: { [string]: string }
}

declare function request(options: RequestOptions): Response
declare function lz4compress(data: string): string
declare function lz4decompress(data: string): string
declare function messagebox(text: string, caption: string, flags: number): number
declare function queue_on_teleport(code: string): ()
declare function setclipboard(text: string): ()
declare function setfpscap(fps: number): ()
-- reflection
declare function gethiddenproperty(instance: Instance, property_name: string): (any, boolean)
declare function getthreadidentity(): number
declare function sethiddenproperty(instance: Instance, property_name: string, property_value: any): boolean
declare function setscriptable(instance: Instance, property_name: string, state: boolean): boolean | nil
declare function setthreadidentity(id: number): ()
-- scripts
declare function getcallingscript(): BaseScript | ModuleScript | nil
declare function getloadedmodules(): { ModuleScript }
declare function getrunningscripts(): { BaseScript | ModuleScript }
declare function getscriptbytecode(script: BaseScript | ModuleScript): string | nil
declare function getscriptclosure(script: BaseScript | ModuleScript): ((...any) -> (...any) | nil)
declare function getscripthash(script: BaseScript | ModuleScript): string | nil
declare function getscripts(): { BaseScript | ModuleScript }
declare function getsenv(script: BaseScript | ModuleScript): { [any]: any } | nil
declare function loadstring<A...>(source: string, chunkname: string?): (((A...) -> any) | nil, string?)
-- signals
declare class Connection
	Enabled: boolean
	ForeignState: boolean
	LuaConnection: boolean
	Function: (...any) -> (...any)?
	Thread: thread?
	
	function Fire(self, ...: any): ()
	function Defer(self, ...: any): ()
	function Disconnect(self): ()
	function Disable(self): ()
	function Enable(self): ()
end
declare function firesignal(signal: RBXScriptSignal, ...: any?)
declare function getconnections(signal: RBXScriptSignal): {Connection}
declare function replicatesignal(signal: RBXScriptSignal, ...: any?)
-- input
declare function isrbxactive(): boolean
declare function mouse1click(): ()
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse2click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(pixels: number): ()