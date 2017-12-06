+++
draft = false
title = "Agile Terminology"
subtitle = ""
tags = ["agile", "scrum"]
date = 2018-01-28T15:48:12-05:00
math = true
summary = """
An explanation on Agile Software Development and Sprint Terminology
"""
+++

# Table Of Contents:

* [12 Principles of Agile Manifesto](#12-principles-of-agile-manifesto)
* [Agile Terminology](#agile-terminology)
* [Sprint Duration](#sprint-duration)
* [Sprint Ceremonies](#sprint-ceremonies)
* [Stories, Tasks and Bugs](#stories\,-tasks-and-bugs)
* [QA](#qa)
* [User Acceptance Testing](#user-acceptance-testing)
* [Releases](#releases)
* [Integration with DevOps](#integration-with-devops)
* [Jira Workflow](#jira-workflows)
* [Definition of Ready and Definition of Done](definition-of-ready-and-definition-of-done)

## 12 Principles of Agile Manifesto

1. Our highest priority is to satisfy the customer through early and continuous delivery of valuable software.

2. Welcome changing requirements, even late in development. Agile processes harness change for the customer's competitive advantage.

3. Deliver working software frequently, from a couple of weeks to a couple of months, with a preference to the shorter timescale.

4. Business people and developers must work together daily throughout the project.

5. Build projects around motivated individuals. Give them the environment and support they need, and trust them to get the job done.

6. The most efficient and effective method of conveying information to and within a development team is face-to-face conversation.

7. Working software is the primary measure of progress.

8. Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely.

9. Continuous attention to technical excellence and good design enhances agility.

10. Simplicity--the art of maximizing the amount of work not done--is essential.

11. The best architectures, requirements, and designs emerge from self-organizing teams.

12. At regular intervals, the team reflects on how to become more effective, then tunes and adjusts its behavior accordingly.

## Agile Terminology

We will define some common agile terms using [The Agile Alliance Glossary](https://www.agilealliance.org/agile101/agile-glossary/)

#### Backlog

[Backlog](https://www.agilealliance.org/glossary/backlog/)

A backlog is a list of features or technical tasks which the team maintains and which, at a given moment, are known to be necessary and sufficient to complete a project or a release:

* if an item on the backlog does not contribute to the project's goal, it should be removed

* if at any time a task or feature becomes known that is considered necessary to the project, it should be added to the backlog.

#### Backlog Grooming

[Backlog Grooming](https://www.agilealliance.org/glossary/backlog-grooming/)

Backlog grooming is when the product owner and some, or all, of the rest of the team review items on the backlog to ensure the backlog contains the appropriate items, that they are prioritized, and that the items at the top of the backlog are ready for delivery. This activity occurs on a regular basis and may be an officially scheduled meeting or an ongoing activity. 

Some of the activities that occur during this refinement of the backlog include:

* removing user stories that no longer appear relevant

* creating new user stories in response to newly discovered needs

* re-assessing the relative priority of stories

* assigning estimates to stories which have yet to receive one

* correcting estimates in light of newly discovered information

* splitting user stories which are high priority but too coarse grained to fit in an upcoming iteration

#### Burndown Chart

[Burndown Chart](https://www.agilealliance.org/glossary/burndown-chart/)

The team displays, somewhere on a wall of the project room, a large graph relating the quantity of work remaining (on the vertical axis) and the time elapsed since the start of the project (on the horizontal, showing future as well as past). This constitutes an "information radiator", provided it is updated regularly. Two variants exist, depending on whether the amount graphed is for the work remaining in the iteration ("sprint burndown") or more commonly the entire project ("product burndown").

#### Continuous Integration

[CI](https://www.agilealliance.org/glossary/continuous-integration/)

Teams practicing continuous integration seek two objectives:

* minimize the duration and effort required by each integration episode

* be able to deliver a product version suitable for release at any moment

**In practice, this dual objective requires an integration procedure which is reproducible at the very least, and largely automated. This is achieved through version control tools, team policies and conventions, and tools specifically designed to help achieve continuous integration.**

#### Definition of Done

[Definition of Done](https://www.agilealliance.org/glossary/definition-of-done/)

The team agrees on, and displays prominently somewhere in the team room, a list of criteria which must be met before a product increment "often a user story" is considered "done". Failure to meet these criteria at the end of a sprint normally implies that the work should not be counted toward that sprint's velocity.

#### Definition of Ready

[Definition of Ready](https://www.agilealliance.org/glossary/definition-of-ready/)

Just as completed items which fit the definition of "done" are said to be "DONE-done", items that fit the definition of ready are called "READY-ready".

An etymological note for the terminally curious: this doubling of a word to call attention to something that is "really" ready or "really" done (as opposed to merely called ready or done, carelessly, without thinking twice about it) is known as "contrastive focus reduplication".

#### Exploratory Testing

[Exploratory Testing](https://www.agilealliance.org/glossary/exploratory-testing/)

Exploratory testing is, more than strictly speaking a "practice," a style or approach to testing software which is often contrasted to "scripted testing," and characterized by the following aspects among others:

* it emphasizes the tester's autonomy, skill and creativity, much as other Agile practices emphasize these qualities in developers;

* it recommends performing various test-related activities (such as test design, test execution, and interpretation of results) in an interleaved manner, throughout the project, rather than in a fixed sequence and at a particular "phase";

* it emphasizes the mutually supportive nature of these techniques, and the need for a plurality of testing approaches rather than a formal "test plan"

#### Kanban

The Kanban Method is a means to design, manage, and improve flow systems for knowledge work. The method also allows organizations to start with their existing workflow and drive evolutionary change. They can do this by visualizing their flow of work, limit work in progress (WIP) and stop starting and start finishing.

The Kanban Method gets its name from the use of kanban - visual signaling mechanisms to control work in progress for intangible work products.

#### Planning Poker

[Planning Poker](https://www.agilealliance.org/glossary/poker/)

A playful approach to estimation, used by many Agile teams.

The team meets in presence of the customer or Product Owner. Around the table, each team member holds a set of playing cards, bearing numerical values appropriate for points estimation of a user story.

The Product Owner briefly states the intent and value of a story. Each member of the development team silently picks an estimate and readies the corresponding card, face down. When everyone has taken their pick, the cards are turned face up and the estimates are read aloud.

The two (or more) team members who gave the high and low estimate justify their reasoning. After brief discussion, the team may seek convergence toward a consensus estimate by playing one or more further rounds.

#### Product Owner

[Product Owner](https://www.agilealliance.org/glossary/product-owner/)

The product owner is a role on a product development team responsible for managing the product backlog in order to achieve the desired outcome that a product development team seeks to accomplish.  Key activities to accomplish this include:

Clearly identify and describe product backlog items in order to build a shared understanding of the problem and solution with the product development team
Make decisions regarding the priority of product backlog items in order to deliver maximum outcome with minimum output
Determine whether a product backlog item was satisfactorily delivered
Ensure transparency into the upcoming work of the product development team.

#### Test-Driven Development (TDD)

[TDD](https://www.agilealliance.org/glossary/tdd/)

**"Test-driven development" refers to a style of programming in which three activities are tightly interwoven: coding, testing (in the form of writing unit tests) and design (in the form of refactoring).**

It can be succinctly described by the following set of rules:

* write a "single" unit test describing an aspect of the program

* run the test, which should fail because the program lacks that feature

* write "just enough" code, the simplest possible, to make the test pass

* "refactor" the code until it conforms to the simplicity criteria

* repeat, "accumulating" unit tests over time

#### Acceptance Testing

[Acceptance Testing](https://www.agilealliance.org/glossary/acceptance/)

An acceptance test is a formal description of the behavior of a software product, generally expressed as an example or a usage scenario. A number of different notations and approaches have been proposed for such examples or scenarios. In many cases the aim is that it should be possible to automate the execution of such tests by a software tool, either ad-hoc to the development team or off the shelf.

Similar to a unit test, an acceptance test generally has a binary result, pass or fail. A failure suggests, though does not prove, the presence of a defect in the product.

#### Acceptance Test-Driven Development (ATDD)

Analogous to test-driven development, Acceptance Test Driven Development (ATDD) involves team members with different perspectives (customer, development, testing) collaborating to write acceptance tests in advance of implementing the corresponding functionality.  The collaborative discussions that occur to generate the acceptance test is often referred to as the three amigos, representing the three perspectives of customer (what problem are we trying to solve?), development (how might we solve this problem?), and testing (what about...).

These acceptance tests represent the user's point of view and act as a form of requirements to describe how the system will function, as well as serve as a way of verifying that the system functions as intended. In some cases the team automates the acceptance tests.

#### Usability Testing

[Usability Testing](https://www.agilealliance.org/glossary/usability/)

Usability testing is a long-established, empirical and exploratory technique to answer questions such as "how would an end user respond to our software under realistic conditions?"

It consists of observing a representative end user interacting with the product, given a goal to reach but no specific instructions for using the product. (For instance, a goal for usability testing of a furniture retailer's Web site might be "You've just moved and need to do something about your two boxes of books; use the site to find a solution.")

#### Velocity

[Velocity](https://www.agilealliance.org/glossary/velocity/)

At the end of each iteration, the team adds up effort estimates associated with user stories that were completed during that iteration. This total is called velocity.

Knowing velocity, the team can compute (or revise) an estimate of how long the project will take to complete, based on the estimates associated with remaining user stories and assuming that velocity over the remaining iterations will remain approximately the same. This is generally an accurate prediction, even though rarely a precise one.

**Please Read the [Agile Alliance Glossary For More Information](https://www.agilealliance.org/agile101/agile-glossary/)**

## Sprint Duration

The Sprint duration is generall 2 weeks but some shops use a 3 week schedule to lessen burden on all parties.

## Sprint Ceremonies

Legend:

* PO
  * Product Owner
* UX
  * User Experience
* TL
  * Team Leads

| Ceremony | Description | Attendees |
| --- | --- | --- |
| Sprint Planning | Takes place on Day 1 of the sprint. Depending on how much work has been done up front in loading the sprint with stories and tasks this could be a 60-90 minute or much longer. The objective is to finish Day 1 with all team members being 100% allocated and ready to start work on Day 2 | All Team Members |
| Sprint Retrospective | To be done on Day 1 or Day 2 of the sprint to review the previous sprint progress and for the teams to state what they think went well and not so well and put in plans to improve. | All Team Members | 
| Daily Standups | To be done daily, preferably before 10am to allow teams to gather and review work they’re doing and any roadblocks.  This is an opportunity to review the sprint burndown and status of the stories and tasks and to ensure the team are heading in the right direction. The PO and Tech Lead are to help respond to questions the team might have to ensure they are delivering what is planned. | All Team Members |
| Pre Grooming | This is a review of upcoming stories or stories in the backlog.  Its a review session to understand whether or not there is enough information contained within the story to “point” the story. If it is found a story does not have enough information, the Product Owner, UX Lead or Tech Lead will need to own next steps to provide more information for the team to apply story points before it goes to the sprint for development. The frequency of this meeting during the sprint is down to the team to own. | PO, UX, TL |
| Backlog Grooming (Pointing) | The entire product backlog needs to be groomed, however due to its size and stories being added over time it will be impossible to have groomed the whole backlog.  The aim of this ceremony is to have groomed the stories being lined up for the next sprint and others that are stack ranked and in priority order. This session can generally only be done if pre grooming has been done first and it is confirmed all the right information exists for a developer to confidently point a story. The frequency of this meeting during the sprint is down to the team to own. | All Team Members |
| Demo Day | This is the final ceremony of the sprint and is a opportunity for the developer to demo the functionality they have built to the product owners and other interested parties. The closing of this ceremony can then lead to business user acceptance testing. | All Team Members |

## Stories, Tasks and Bugs

* Stories are to be “pointed” as part of the backlog grooming process.
  * Each team should advise on their planned velocity in the upcoming sprint.

* Initially the sprint should be loaded with the planned capacity in points.

* During sprint planning (or days leading up to) tasks are to be added to each story in the planned sprint.
  * Hours of effort are to be assigned to each task.

* During sprint planning a review of the teams capacity in hours should be undertaken alongside the planned work and before the end of sprint planning all team members should be set to 100% capacity.

* When bugs are planned to be fixed in the sprint (as agreed during sprint planned) the bugs should also have tasks with estimated hours applied to them to track the work effort.