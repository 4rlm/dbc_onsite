- As a baker, I want to make different types of cookies (peanut butter, chocolate chip, etc.).
- As a baker, I want to place batches of cookies in an oven.
- As a baker, I want to know when a batch of cookies is ready to be removed from the oven.

- What are essential classes?
--Cookie
--Oven


- What attributes will each class have?
--Cookie
---Type
---Status
---Current Bake Time
---Max Bake Time

--Oven
---Batch <- rack?
---on status
---temp
---timer



- What interface will each class provide?
--Cookie
---bake - to update status
---attr_readers for type, status, max_bake_time, current_bake_time

Oven
---Add batch
---turn on
---set timer
---remove batch
---turn off

- How will the classes interact with each other?
Cookie <->  Oven

- Does inheritance make sense?
Cookie types?
