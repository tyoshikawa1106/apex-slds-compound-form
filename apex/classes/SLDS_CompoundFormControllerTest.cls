@isTest
private class SLDS_CompoundFormControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void SLDS_CompoundFormControllerTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            SLDS_CompoundFormController cls = new SLDS_CompoundFormController(new ApexPages.StandardController(new Account()));
            
            Test.stopTest();
        }
    }

    /**
     * 保存処理
     */
    static testMethod void doSaveTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            SLDS_CompoundFormController cls = new SLDS_CompoundFormController(new ApexPages.StandardController(new Account()));
            cls.account.Name = 'Salesforc.com';
            cls.doSave();


            Test.stopTest();

            System.assertEquals(String.isNotEmpty(cls.account.Id), true);
        }
    }
}