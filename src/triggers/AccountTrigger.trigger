/*
	Example trigger for the Account object.

	Note that the trigger implements all events, and just contains a single line of code to call the TriggerDispatcher.

	Author: Chris Aldridge, http://chrisaldridge.com
*/
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
	// Call the trigger dispatcher and pass it an instance of the AccountTriggerHandler
	TriggerDispatcher.Run(new AccountTriggerHandler(), Trigger.operationType);
}
