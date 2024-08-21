public with sharing class StringListCreate {
    public static String[] generateStringList(Integer n)
    {
        Integer i = 0;
        String[] Table = new List<String>();
        for (i=0; i < n; i++)
        {
            Table.add('Test '+i);
        }
        return Table;
    }

}