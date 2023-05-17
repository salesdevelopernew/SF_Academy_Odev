        List<Account> accs = [SELECT Id, Name, AnnualRevenue, Type FROM Account LIMIT 5];

        for(Account acc: accs){
            String jsonString = JSON.serialize(acc);
            System.debug(jsonString);  
        }

        Account acc=[SELECT Id, Name, AnnualRevenue, Type,(SELECT Id, FirstName, LastName FROM Contacts ) FROM Account WHERE Name='United Oil & Gas Corp.' LIMIT 1];
            String jsonString1 = JSON.serialize(acc);
            String jsonString2 = JSON.serialize(acc.Contacts);

            System.debug('Acc'+jsonString1);
            System.debug('Con'+jsonString2);


        Account acc=[SELECT Id, Name, AnnualRevenue, Type,(SELECT Id, Amount, StageName FROM Opportunities ) FROM Account WHERE Name='United Oil & Gas Corp.' LIMIT 1];
            String jsonString1 = JSON.serialize(acc);
            String jsonString2 = JSON.serialize(acc.Opportunities);

            System.debug('Acc'+jsonString1);
            System.debug('opp'+jsonString2);

RestCallouts.getAquote();