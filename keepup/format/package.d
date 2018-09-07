/**** Provides common format utilities.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module keepup.format;

import keepup.task;

@safe:

/// A list of supported formats.
enum Format {
  sdl,
}

/// Reads a task list from the given data.
Task[] readTasks(string fileName) {
  import std.path: extension;
  import std.range: dropOne;
  import std.file: readText;
  import std.utf: toUTF8;

  // Mixin module imports
  static foreach (m; __traits(allMembers, Format))
    mixin(`import keepup.format.` ~ m ~ `;`);

  // Match end of name against valid suffixes.
  auto suf = fileName.extension.dropOne.toUTF8;
  switch (suf) {
    static foreach (m; __traits(allMembers, Format)) {
      case formatSuffix!(__traits(getMember, Format, m)):
        return unformat!(__traits(getMember, Format, m))(fileName.readText!string);
    }
    default:
      throw new Exception("Unrecognized task list file extension \"" ~ suf ~ "\"");
  }
}
