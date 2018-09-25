/*
	This class runs the appropriate methods on the trigger handler based on the current trigger context.

	Author: Chris Aldridge, http://chrisaldridge.com
*/
public class TriggerDispatcher 
{
	/*
		Call this method from your trigger, passing in an instance of a trigger handler which implements ITriggerHandler.
		This method will fire the appropriate methods on the handler depending on the trigger context.
	*/
	public static void Run(ITriggerHandler handler, System.TriggerOperation triggerEvent)
	{
		// Check to see if the trigger has been disabled. If it has, return
		if (handler.IsDisabled())
			return;

		// Detect the current trigger context and fire the relevant methods on the trigger handler:

		switch on triggerEvent {
		  when BEFORE_INSERT {
		    handler.BeforeInsert(trigger.new);
		  }
		  when BEFORE_UPDATE {
		    handler.BeforeUpdate(trigger.newMap, trigger.oldMap);
		  }
		  when BEFORE_DELETE {
		    handler.BeforeDelete(trigger.oldMap);
		  }
		  when AFTER_INSERT {
		    handler.AfterInsert(Trigger.newMap);
		  }
		  when AFTER_UPDATE {
		    handler.AfterUpdate(trigger.newMap, trigger.oldMap);
		  }
		  when AFTER_DELETE {
		    handler.AfterDelete(trigger.oldMap);
		  }
		  when AFTER_UNDELETE {
		    handler.AfterUndelete(trigger.oldMap);
		  }
		}
	}
}
