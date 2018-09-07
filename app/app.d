/**** Provides the main execution point.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module app;

import keepup.format;

import std.stdio;

void main(string[] args) {
  // TODO: Combine environment check, default, and commandline to get task file.
  string name = args.length > 1 ? args[1] : "test.sdl";

  foreach (task; name.readTasks)
    task.write;
}
