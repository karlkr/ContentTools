class RedColor extends ContentTools.Tool

    # Make current text background red (e.g <span style="color:red">foo</span>)

    ContentTools.ToolShelf.stow(@, 'red')

    @label = 'Red'
    @icon = 'red'
    @tagName = 'span'

    @canApply: (element, selection) ->
        # Return true if the tool can be applied to the current
        # element/selection.
        unless element.content
            return false

        return selection and not selection.isCollapsed()

    @isApplied: (element, selection) ->
        # Return true if the tool is currently applied to the current
        # element/selection.
        if element.content is undefined or not element.content.length()
            return false

        [from, to] = selection.get()
        if from == to
            to += 1

        return element.content.slice(from, to).hasTags(@tagName, true)

    @apply: (element, selection, callback) ->
        # Apply the tool to the current element

        # Dispatch `apply` event
        toolDetail = {
            'tool': this,
            'element': element,
            'selection': selection
            }
        if not @dispatchEditorEvent('tool-apply', toolDetail)
            return

        element.storeState()

        [from, to] = selection.get()

        if @isApplied(element, selection)
            element.content = element.content.unformat(
                from,
                to,
                new HTMLString.Tag(@tagName, {'style':'color:red'})
                )
        else
            element.content = element.content.format(
                from,
                to,
                new HTMLString.Tag(@tagName, {'style':'color:red'})
                )

        element.content.optimize()
        element.updateInnerHTML()
        element.taint()

        element.restoreState()

        callback(true)

        # Dispatch `applied` event
        @dispatchEditorEvent('tool-applied', toolDetail)