class ContentTools.AdminUI extends ContentTools.WidgetUI

    # To control editing of content (starting/stopping) a ignition switch is
    # provided, the switch has 3 states:
    #
    # - ready    - Displays an edit option
    # - editing  - Displays confirm and cancel options
    # - busy     - Displays a busy status animation

    constructor: (adminFunction) ->
        super()

        @_adminFunction = adminFunction;


    # Methods

    go: () ->
        # Dispatch the go event against the switch and set its state to
        # ready.
        if @dispatchEvent(@createEvent('go'))
            @_adminFunction();

    mount: () ->
        # Mount the component to the DOM
        super()

        # Base widget component
        @_domElement = @constructor.createDiv([
            'ct-widget',
            'ct-admin',
            'ct-admin--ready'
            ])
        @parent().domElement().appendChild(@_domElement)

        # Cancel button
        @_domGo = @constructor.createDiv([
            'ct-admin__button',
            'ct-admin__button--go'
            ])
        @_domElement.appendChild(@_domGo)

        # Add events
        @_addDOMEventListeners()

    unmount: () ->
        # Unmount the widget from the DOM
        super()

        @_domGo = null

    # Private methods

    _addDOMEventListeners: () ->
        # Add all DOM event bindings for the component in this method
        # Stop editing - Cancel changes
        @_domGo.addEventListener 'click', (ev) =>
            ev.preventDefault()
            @go()
