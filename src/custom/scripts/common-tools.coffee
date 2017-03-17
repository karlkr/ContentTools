class Strong extends ContentTools.Tools.Bold
    # Make the current selection of text (non)strong (e.g <strong>foo</strong>). Bold is deprecated

    # Register the tool with the toolshelf
    ContentTools.ToolShelf.stow(@, 'strong')

    @label = 'Strong'
    @icon = 'bold'
    @tagName = 'strong'

class Emphasize extends ContentTools.Tools.Bold
    # Make the current selection of text (non)italic (e.g <i>foo</i>).

    ContentTools.ToolShelf.stow(@, 'em')

    @label = 'Emphasize'
    @icon = 'italic'
    @tagName = 'em'

class Event extends ContentTools.Tools.AlignLeft

    # Apply an event class to the contents of the current text block.

    ContentTools.ToolShelf.stow(@, 'event')

    @label = 'Event'
    @icon = 'event'
    @className = 'event'
