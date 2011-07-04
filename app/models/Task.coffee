## Create the Task model.
Task = module.exports = Spine.Model.setup("Task", ["name", "done"]);

## Persist model between page reloads.
Task.extend(Spine.Model.Local);

Task.extend({
    ## Return all active tasks.
    active: ->
        this.select (item) ->
            !item.done
  
  
    ## Return all done tasks.
    done: ->
        this.select (item) ->
            !!item.done    
  
    ## Clear all done tasks.
    destroyDone: ->   
        jQuery(this.done()).each (i, rec) ->
            rec.destroy()
  
})




