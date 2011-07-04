
Task = require('models/Task')
Tasks = require('controllers/Tasks')

module.exports = Spine.Controller.create
    el:$("#tasks"),

    proxied: [
        "addOne"
        "addAll"
        "renderCount"],

    events:
        "submit form":   "create"
        "click  .clear": "clear"

    elements: 
      ".items":     "items"
      ".countVal":  "count"
      ".clear":     "clear"
      "form input": "input"

    init: ->
        Task.bind "create",  this.addOne
        Task.bind "refresh", this.addAll
        Task.bind "refresh change", this.renderCount
        Task.fetch()

  
    addOne: (task) ->
        console.log 'addOne', task.name
        view = Tasks.init {item: task}
        this.items.append view.render().el
    

    addAll: ->
        Task.each this.addOne
    
        
    create: ->
        console.log 'input',this.input.val()
        Task.create {name: this.input.val()}
        this.input.val ""
        false
    
    
    clear: ->
        Task.destroyDone()
    
    
    renderCount: ->
        active = Task.active().length
        this.count.text active
        inactive = Task.done().length;
        if inactive
            this.clear["show"]()
        else
            this.clear["hide"]()        
