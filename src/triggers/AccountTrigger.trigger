/**
 * @description  Example trigger for the Account object.
 *               Note that the trigger implements all events, and just contains a single 
 *               line of code to call the TriggerDispatcher.
 * @author Chris Aldridge, http://chrisaldridge.com/triggers/lightweight-apex-trigger-framework/
 * @date Dec 31, 2015
 * @author Sep 25 by krigi, https://github.com/krigi/Lightweight-Trigger-Framework , 
 *                          Updated by krigi to take advantage of Summer’18 feature: Trigger.operationType context variable
 * @date Sep 25, 2018
 * @author Mark H. Morrison, https://github.com/MarkHMorrison/Lightweight-Trigger-Framework
 * @date Sat Dec 29, 2018
 */
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
  // Call the trigger dispatcher and pass it an instance of the AccountTriggerHandler
  TriggerDispatcher.Run(new AccountTriggerHandler());
}
