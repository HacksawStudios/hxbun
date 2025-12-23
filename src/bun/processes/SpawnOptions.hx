package bun.processes;

import haxe.extern.EitherType;
import haxe.io.BytesData;
import helpers.EitherOf.EitherOf5;
import js.html.AbortSignal;
import js.html.Blob;
import js.html.Request;
import js.html.Response;

/**
 * Options for spawning a child process
**/
typedef SpawnOptions = {
	?cwd:String,
	?env:Dynamic<String>,
	?stdin:StdinIO,
	?stdout:ReadableIO,
	?stderr:ReadableIO,
	?stdio:Array<StdioOption>,
	?onExit:(subprocess:Subprocess, exitCode:Null<Int>, signalCode:Null<Int>, ?error:Dynamic) -> Void,
	?ipc:(message:Any, subprocess:Subprocess) -> Void,
	?serialization:EitherType<String, IPCMessageSerializationType>,
	?windowsHide:Bool,
	?windowsVerbatimArguments:Bool,
	?argv0:String,
	?signal:AbortSignal,
	?timeout:Int,
	?killSignal:EitherType<String, Int>,
	?maxBuffer:Int
}

/**
 * Common IO types shared between readable and writable.
**/
typedef CommonIO = EitherOf5<String, bun.BunFile, js.lib.ArrayBufferView, Int, Null<Dynamic>>;

/**
 * Type for readable process stdio configuration (stdout/stderr).
**/
typedef ReadableIO = EitherType<CommonIO, BytesData>;

/**
 * Type for writable process stdio configuration (stdin).
**/
typedef StdinIO = EitherType<ReadableIO, EitherType<bun.ReadableStream, EitherType<Blob, EitherType<Response, Request>>>>;

/**
 * Type for elements in the stdio array. Uses StdinIO to encompass all possibilities.
**/
typedef StdioOption = StdinIO;

/**
 * Placeholder for Subprocess type (update as needed based on externs).
**/
typedef Subprocess = Dynamic;
