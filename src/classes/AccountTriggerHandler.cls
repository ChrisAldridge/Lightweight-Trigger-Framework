/**
 * @description  Example trigger handler for the Account object.
 *               In this example, we are checking on both before insert and before update to ensure that the 
 *               name of the account does not include the string 'test'.
 *               Note that we have to implement the other events (BeforeDelete, AfterInsert) etc even though 
 *               we are not using them (yet).
 * @author Chris Aldridge, http://chrisaldridge.com/triggers/lightweight-apex-trigger-framework/
 * @date Dec 31, 2015
 * @author Mark H. Morrison, https://github.com/MarkHMorrison/Lightweight-Trigger-Framework
 * @date Sat Dec 29, 2018
 */
public class AccountTriggerHandler implements ITriggerHandler {
  /**
   * Allows unit tests (or other code) to disable this trigger for the transaction
   * To stop this trigger from firing while in a unit test, I could just add the following code to the test:
   * AccountTriggerHandler.TriggerDisabled = true;
   */
  public static Boolean TriggerDisabled = false;
  /**
   * Checks to see if the trigger has been disabled. For example, you could check a custom setting here.
   * In this example, a static property is used to disable the trigger.
   * In a unit test, you could use AccountTriggerHandler.TriggerDisabled = true to completely disable the trigger.
   */
  public Boolean IsDisabled() {
    /*
      Use the option below if you set up Custom Settings to control Triggers
    */
    // if(TriggerSettings__c.AccountTriggerDisabled__c = true) {
    //   return true;
    // } else {
    //   return TriggerDisabled;
    // }
    return TriggerDisabled;
  }

  public void BeforeInsert(List<SObject> newItems) {
    // Cast the Sobject[] to Account[]
    AccountNameCheck((Account[])newItems);
  }

  public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {
    // Cast the Map<Id, Sobject> to Account[]
    AccountNameCheck((Account[])newItems.values());
  }

  public void BeforeDelete(Map<Id, SObject> oldItems) {}

  public void AfterInsert(Map<Id, SObject> newItems) {}

  public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}

  public void AfterDelete(Map<Id, SObject> oldItems) {}

  public void AfterUndelete(Map<Id, SObject> oldItems) {}

  /*
    Check the accounts to make sure their name does not contain the text "test".
    If any do, reject them.
  */
  private void AccountNameCheck(Account[] accountList) {
    // Reject any Accounts which have the word "Test" in the name
    for(Account iAccount : accountList) {
      if(iAccount.Name.containsIgnoreCase('test')) {
        iAccount.Name.addError('You may not use the word "test" in the account name');
      }
    }
  }
}
