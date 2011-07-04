module.exports = Spine.Controller.create
    tag: "li",
    
    proxied: ["render", "remove"],
    
    events:
        "change   input[type=checkbox]": "toggle"   
        "click    .destroy":             "destroy"
        "dblclick .view":                "edit"
        "keypress input[type=text]":     "blurOnEnter"
        'blur     input[type=text]':     "close"
    
    elements:
        "input[type=text]": "input"
        ".item": "wrapper"

    
    init: ->
        this.item.bind "update",  this.render
        this.item.bind "destroy", this.remove
    
    
    render: ->
        ###this.item = 
            done:true
            test:'test'
        ###
        console.log this.item
        ##elements = $("#contact-template").tmpl this.item
        elements = $("#taskTemplate").tmpl this.item
        this.el.html elements
        this.refreshElements()
        this
    
    toggle: ->
        this.item.done = !this.item.done
        this.item.save()
    
    destroy: ->
        this.item.destroy()
    
    edit: ->
        this.wrapper.addClass "editing"
        this.input.focus()
    
    blurOnEnter: (e) ->
        e.target.blur() if (e.keyCode == 13)
    
    
    close: ->
        this.wrapper.removeClass "editing"
        this.item.updateAttributes {name: this.input.val()}
    
    
    remove: ->
        this.el.remove()
  
