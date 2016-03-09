public with sharing class SLDS_CompoundFormController {

    public Account account {get; set;}

    /**
     * コンストラクタ
     */
    public SLDS_CompoundFormController(ApexPages.StandardController stdController) {
        this.account = (Account)stdController.getRecord();
    }

    /**
     * 保存処理
     */
    public PageReference doSave() {
        try {
            upsert this.account;
        } catch(DmlException e) {
            ApexPages.addMessages(e);
            return null;
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,e.getMessage()));
            return null;
        }
        
        return new PageReference('/' + this.account.Id);
    }
}