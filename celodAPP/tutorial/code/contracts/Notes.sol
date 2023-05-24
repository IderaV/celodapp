// Notes.sol

pragma solidity ^0.8.0;

import "./NoteAccessControl.sol";

contract Notes is NoteAccessControl {
  struct Note {
    uint256 id;
    string content;
  }

  mapping(uint256 => Note) private notes;
  uint256 private noteCount;

  event NoteCreated(uint256 id, string content);
  event NoteUpdated(uint256 id, string content);

  function createNote(string memory content) public onlyAdminOrEditor {
    noteCount++;
    notes[noteCount] = Note({
      id: noteCount,
      content: content
    });

    emit NoteCreated(noteCount, content);
  }

  function updateNoteContent(uint256 id, string memory newContent) public onlyAdminOrEditor {
    require(id > 0 && id <= noteCount, "Invalid note ID");

    Note storage note = notes[id];
    note.content = newContent;

    emit NoteUpdated(id, newContent);
  }

  function getNoteContent(uint256 id) public view returns (string memory) {
    require(id > 0 && id <= noteCount, "Invalid note ID");

    Note storage note = notes[id];
    return note.content;
  }
}
