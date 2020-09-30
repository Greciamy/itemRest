Feature: Item

  @Test
  Scenario: As a user I want to create an item so that organize my project

    Given I have authenticated to todo.ly
    And I send POST request 'api/projects.json' with json to add an item after that
    """
    {
       "Content":"TEST ITEM",
       "Icon": 4
    }
    """
    And I get the property value 'Id' and save on ID_PROJECT

    When I send POST request 'api/items.json' with json
    """
    {
        "Content": "New item",
        "ProjectId": ID_PROJECT
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": "EXCLUDE",
        "Content": "New item",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": ID_PROJECT,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": 1,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 676050
    }
    """
    And I get the property value 'Id' and save on ID_ITEM
    And I get the property value 'Content' and save on CONTENT_ITEM


    When I send PUT request 'api/items/ID_ITEM.json' with json
    """
    {
        "Content": "CONTENT_ITEM UPDATE",
        "ProjectId": ID_PROJECT
    }
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": ID_ITEM,
        "Content": "CONTENT_ITEM UPDATE",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": ID_PROJECT,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": 1,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": "EXCLUDE",
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": "EXCLUDE",
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": false,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 676050
    }
    """


    When I send DELETE request 'api/items/ID_ITEM.json' with json
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": ID_ITEM,
        "Content": "CONTENT_ITEM UPDATE",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": ID_PROJECT,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": 1,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": null,
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": true,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 676050
    }
    """


    When I send GET request 'api/items/ID_ITEM.json' with json
    """
    """
    Then I expected the response code 200
    And I expected the response body is equal
    """
    {
        "Id": ID_ITEM,
        "Content": "CONTENT_ITEM UPDATE",
        "ItemType": 1,
        "Checked": false,
        "ProjectId": ID_PROJECT,
        "ParentId": null,
        "Path": "",
        "Collapsed": false,
        "DateString": null,
        "DateStringPriority": 0,
        "DueDate": "",
        "Recurrence": null,
        "ItemOrder": 1,
        "Priority": 4,
        "LastSyncedDateTime": "EXCLUDE",
        "Children": [],
        "DueDateTime": null,
        "CreatedDate": "EXCLUDE",
        "LastCheckedDate": null,
        "LastUpdatedDate": "EXCLUDE",
        "Deleted": true,
        "Notes": "",
        "InHistory": false,
        "SyncClientCreationId": null,
        "DueTimeSpecified": true,
        "OwnerId": 676050
    }
    """


