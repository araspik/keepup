/**** Provides SDLang serialization support.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module keepup.format.sdl;
import keepup.format;

import keepup.task;
import sdlang;

@safe:

/// Provides the suffix of SDL files.
enum formatSuffix(Format _: Format.sdl) = "sdl";

/// Un-formats a list of tasks from `data`, which is formatted as SDL.
@trusted Task[] unformat(Format _: Format.sdl)(string data) {
  import std.range: front;
  import std.array: array;
  import std.algorithm: filter, map;
  // TODO: Add configuration support.
  return data.parseSource.all.tags.filter!(t => t.name == "task").map!((t) {
      Task res;
      with (res) {
        id = t.attributes.filter!(a => a.name == "id").front.value.get!size_t;
        name = t.values.front.get!string;
        details = t.getTagValue!string("details");
        creation = t.getTagValue!DateTimeFrac("created").dateTime;
        starting = t.getTagValue!DateTimeFrac("started").dateTime;
        ending = t.getTagValue!DateTimeFrac("ending").dateTime;
      }
      return res;
    }).array;
}
