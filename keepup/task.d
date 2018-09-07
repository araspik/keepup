/**** Provides a task type.
  * 
  * Author: ARaspiK
  * License: MIT
  */
module keepup.task;

import std.format: format;
import std.datetime: DateTime;

/// A task type, the core of KeepUp.
struct Task {
  /// The task ID.
  size_t id;
  /// The task name.
  string name;
  /// Task details.
  string details;
  /// Time task was created.
  DateTime creation;
  /// Time task was started.
  DateTime starting;
  /// Time task is due or was finished.
  DateTime ending;

  /// Converts to a human-readable string. Format is not fixed and may change.
  public string toString() {
    return format!"%u: %s.\n  %s\n* Created %s\n* Started %s\n* Due %s\n"
      (id, name, details, creation, starting, ending);
  }
}
