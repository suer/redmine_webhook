Redmine WebHook Plugin
======================

A Redmine plugin posts webhook on creating and updating tickets.

Author
------------------------------
* @suer

Install
------------------------------
Type below commands:

    $ cd $RAILS_ROOT/plugins
    $ git clone git://github.com/ffogarasi/redmine_webhook.git
    $ rake redmine:plugins:migrate RAILS_ENV=production

Then, restart your redmine.

Post Data Example
------------------------------

### Issue opened

    {
      "payload": {
        "issue": {
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "user",
            "firstname": "test",
            "mail": "test@example.com",
            "login": "test",
            "id": 3
          },
          "assignee": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "user",
            "firstname": "test",
            "mail": "test@example.com",
            "login": "test",
            "id": 3
          },
          "priority": {
            "name": "normal",
            "id": 2
          },
          "tracker": {
            "name": "bug",
            "id": 1
          },
          "parent_id": null,
          "root_id": 191,
          "closed_on": null,
          "updated_on": "2014-03-01T15:17:48Z",
          "created_on": "2014-03-01T15:17:48Z",
          "description": "I'm having a problem with this.",
          "subject": "Found a bug",
          "id": 191,
          "done_ratio": 0,
          "start_date": "2014-03-02",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 0,
          "project": {
            "homepage": "",
            "created_on": "2013-01-12T11:50:26Z",
            "description": "",
            "name": "Test Project",
            "identifier": "test",
            "id": 4
          },
          "status": {
            "name": "new",
            "id": 1
          }
        },
        "action": "opened",
        "url": "https://example.com"
      }
    }

### Issue updated

    {
      "payload": {
        "url": "https://example.com",
        "journal": {
          "details": [],
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "user",
            "firstname": "test",
            "mail": "test@example.com",
            "login": "test",
            "id": 3
          },
          "assignee": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "user",
            "firstname": "test",
            "mail": "test@example.com",
            "login": "test",
            "id": 3
          },
          "private_notes": false,
          "created_on": "2014-03-01T16:22:46Z",
          "notes": "Fixed",
          "id": 195
        },
        "issue": {
          "author": {
            "icon_url": "http://www.gravatar.com/avatar/example",
            "identity_url": null,
            "lastname": "user",
            "firstname": "test",
            "mail": "test@example.com",
            "login": "test",
            "id": 3
          },
          "priority": {
            "name": "normal",
            "id": 2
          },
          "tracker": {
            "name": "bug",
            "id": 1
          },
          "parent_id": null,
          "root_id": 196,
          "closed_on": null,
          "updated_on": "2014-03-01T16:22:46Z",
          "created_on": "2014-03-01T15:44:22Z",
          "description": "test",
          "subject": "Found a bug",
          "id": 196,
          "done_ratio": 0,
          "start_date": "2014-03-02",
          "due_date": null,
          "estimated_hours": null,
          "is_private": false,
          "lock_version": 2,
          "project": {
            "homepage": "",
            "created_on": "2013-01-12T11:50:26Z",
            "description": "",
            "name": "Test Project",
            "identifier": "test",
            "id": 4
          },
          "status": {
            "name": "normal",
            "id": 1
          }
        },
        "action": "updated"
      }
    }

Requirements
------------------------------
* Redmine 2.4, 2.6, 3.0


Known Limitations
------------------------------

An update from context menu doesn't call a webhook event.
It is caused by a lack of functionality hooking in Redmine.
Please see https://github.com/suer/redmine_webhook/issues/4 for details.

This limitation has been affected on all Redmine versions includes 2.4, 2.6,
and 3.0. It is not fixed in end of April, 2015.


License
------------------------------
The MIT License (MIT)
Copyright (c) suer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
