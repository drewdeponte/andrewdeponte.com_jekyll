---
layout: post
title: Git Based Workflow Revised
date: 2010-10-25
tags: [Git, GitHub, Source Control, Team Workflow, Project Management, Software Development]
---
If you happened to read my previous post [An Ideal Git Based Team
Workflow](/2010/10/24/An-Ideal-Git-Based-Team-Workflow.html) this posting is a result
of taking that concept and discussing it heavily with my team as well as
further contemplating the issues and solutions.

### The Real Requirements

After reviewing my thoughts and discussing things further with my team I
determined that a number of aspects of the previously defined workflow are not
needed. In fact they were overcomplicating the workflow due to a lack of
understanding of the actual requirements. One such requirement was the concept
that branches should parallel deployment environments. This is not actually a
requirement and I was sadly imposing it as one in my initial workflow. In
hindsight this was primarily due to the fact that it was the focal point of a
number of discussions with one of my developers, Michael Genereux. This
singular mistaken requirement imposes a huge amount of complexity and
constraint into the workflow for no significant value in my opinion. The set of
requirements that I now believe are true requirements of our workflow are
presented in the list below.

* Overhead on the developers should be as minimal as possible
* Overhead on the integrators should be as minimal as possible
* Hotfix deployments should be able to trivially be made
* Content deployments should be able to trivially be made
* Iterative development cycles can happen parallel to Hotfix and Content
  development & deployment
* Code review and feedback is needed for our inexperienced developers so that
  they can learn
  
### The Two Roles

After, isolating the correct requirements I determined that in order to satisfy
the minimalistic overhead requirements as well as the code review/feedback
requirements we were going to need two different roles within our workflow. The
first role is what I will from this point on refer to as an "Integrator". In
reality an "Integrator" in my mind is simply a developer that is skilled enough
to follow carefully designed policy, doesn't need much guidance, and fully
understands the core concepts of Git and why the workflow policies exist. The
second role is what I will refer to as a "Newb". A "Newb" in this case is
simply a less experienced developer that may need more guidance, heavier code
review, and more direction in general.

#### The Integrator

The group of developers which fall within the "Integrator" title are
responsible for not only doing their normal iteration development but also for
performing code review and providing feedback to the "Newbs". Beyond that they
are responsible for following the provided policies to manage Hotfixes, Content
changes, and the normal iterative development cycle. The policies for each of
these areas with respect to "The Integrator" role are provided below.

#### Hotfixes

In this workflow I am defining hotfixes simply as changes that have to be made
and deployed abruptly out side of a normal iteration deployment. These are
normally severe bugs that drastically hinder the user experience and must be
fixed asap.

Developers of the "Integrator" role are required when creating a hotfix or
series of hotfixes to create a remote branch for the hotfixes within the
current weeks iteration. The branch should be based on the release that the
hotfixes are going to apply to. Secondarily the name of the branch should be of
the following format, `"week_<week number>_hotfixes"`. Once the remote branch
exists development of the hotfixes should occur on the newly created hotfixes
branch. Once the branch reaches a state in which it is ready to be released
into the accelerated pipeline it should be tagged using the release naming
scheme and deployed.

### Content Changes

In this workflow I am defining content changes simply as changes which need to
be deployed on a more frequent basis than the normal iteration deployments.
Beyond that they are generally changes to assets or textual changes needed by
marketing, etc. which have less of a functional involvement.

Developers of the "Integrator" role are not usually the developers making these
changes directly. However, they are responsible for reviewing, integrating, and
providing feedback to the "Newbs" that are making these changes through the
"Newb" workflow as defined below. Hence, the "Integrators" should pull in the
"Newbs" content changes after reviewing them and merge them into the current
weeks remote branch for content changes. This branch should have a name of the
following format, `"week_<week number>_content"`. If this branch doesn't exist at
the time in which an "Integrator" needs it they are responsible for creating
it. Once this branch reaches a state in which it is ready to be deployed, it
should be tagged using the release naming scheme and deployed into the
pipeline.

### Normal Iteration

In this workflow a normal iteration is simple a release cycle of two weeks.
Within a normal iteration "Integrators" are responsible for not only managing
content and hotfixes from "Newbs" but also managing normal iteration
development from "Newbs". Beyond that "Integrators" are responsible for
performing their normal development work for the current iteration. All
development changes should be performed inside specific topic branches and
never directly on the master branch. If features/bugs are large enough that
they may consume multiple days of development they should have their own remote
topic branch. This allows other developers to participate or at a minimum
obtain the partially completed changes which you have made. Beyond that never
developing directly on master makes abrupt context switching trivial. Once a
topic branch has reached a point in which it is ready to be merged into the
current weeks iteration and ready for the pipeline the "Integrator" should
merge it into the master branch and push the updated master branch to the
central repository.

### The Newb

The developers which fall within the "Newb" title are responsible for
performing their development tasks and learning the process and value of the
workflow policies as well as the technologies and languages which they are
using. Ideally the "Newbs" progress to "Integrators" eventually. Their tasks
similar to the "Integrators" may consist of development work for Hotfixes,
Content Changes, or Normal Iteration development. However, one way they differ
is in the process and policies they have to follow when performing these tasks.
The workflow for each of these types of changes with respect to "Newbs" is
provided below.

#### Hotfixes

A "Newb" similar to an "Integrator" is required to do all development within
topic branches. However, when a "Newb" believes they are ready to have their
changes included in the current weeks hotfixes branch they must make a Pull
Request via GitHub to their upstream repository. GitHub will then notify all of
the "Integrators" of the new pull request and allow them to review the changes,
provide any feedback and merge the changes in. GitHub will also allow the
"Integrators" to throw the changes back to the "Newb" with feedback rather than
merging the changes in.

### Content Changes

With respect to a "Newb" content changes work exactly the same way as Hotfixes.
They simply develop their content changes and submit an appropriate Pull
Request via GitHub to their upstream repository so that an "Integrator" can
appropriately deal with their changes and provide any feedback.

### Normal Iteration

"Newbs" follow the same process for Normal Iteration development as they did
Hotfixes and Content Changes. Develop the changes in a topic branch and submit
a Pull Request via GitHub.

### Requirements Review

I believe that the above workflows and policies provide a solid basis for a
well rounded team with very little overhead and a decent amount of flexibility
with respect to parallel releases being made at different rates. Please note
additional parallel releases can be added simply by adding additional
conceptual types of changes to my current list of Hotfixes, Content Changes,
and Normal Iteration Development.

### Release Naming Scheme

Given that we are developing by either week or two week iterations I have
decided that we should use the following naming scheme for tagging releases:

`release-YY.<week_num>-rc<release candidate counter>`

The YY represents the year for 2010 it should be 10. The `<week_num>` is the week
number and the `<release candidate counter>` is a counter for this iteration that
reset at the beginning of each iteration. Once a final tagged release for
production is ready to be made it should use the following naming scheme.

`release-YY.<week_num>-rf<release candidate counter>`

All the variables in the naming scheme for final tags are the same as those in
the latest rc for a weekly iteration. For example if the latest rc is
release-10.34-rc6 and no changes have been made since that tag and the code is
ready to be tagged for a production release it should be tagged as
release-10.34-rf6.

### Topic Branch Naming Scheme

When naming topic branches it is required that you use the following naming
scheme.

`<type char><ticket id>_<name>`

The `<type char>` is a character that defines if it is a task (t), bug (b), or
feature (f). The ticket id is the unique identifier of the ticket in the
ticketing system that corresponds to this topic branch. The `<name>` is a short
but meaningful name that describes the topic branch.

### Don't Tie Deployment Environments to Branches

So, as I stated in the opening I was assuming in the previous article that each
deployment environment should have a branch that parallels it. This was an idea
that was presented to me by one of my developers and I mistakenly ran with it.
The following is an explanation of why I believe doing this is not valuable and
potentially costly. Also, I am not pointing this out to pick on my developer.
In fact it is quite the opposite. I am glad that he forced me to think about
alternatives in great depth because the process has only more solidified my
belief in the workflow and policies presented above. Beyond that, the
explanation of my opinion may help him or others come to the same or even a
better conclusion/workflow.

For some reason I couldn't initially place my finger on what was wrong with
using branches that paralleled the deployment environments of development, qa,
staging, and production. I knew that I really hated the overhead of having to
deal with cherry picking changes from one branch to the next to simulate the
pipeline but I still simply saw that as its own issue which inspired me to come
up with the previous and very flawed workflow, An Ideal Git Based Team
Workflow.

Today after an insane amount of contemplation, discussion, and fiddling with
the workflow the answer finally came to me. The problem with the Deployment
Environments mapping to branches is that from a workflow perspective we don't
really care about the deployment environments other than the tagged release
that is currently deployed in each environment. This information can easily be
obtained without branches that map to the environments by correlating the
deployed tag in a given environment to the matching tag in Git.

What we do care about with respect to a workflow however is the ability to be
able to cleanly share code changes as well as be able to handle a number of
parallel releases. I have chosen to represent these parellel releases via
different classifications of changes in the above workflow. Specifically,
Hotfixes, Content Changes, and Normal Iteration Development.

When you test these two models it is very interesting because in the model
where you have branches for each deployment environment you end up spending a
huge amount of overhead simulating something for no reason. The primary cost in
overhead is the amount of merging and cherry-picking that is necessary to keep
the states of the branches in line. Secondly, it does NOT allow you to make
parallel deployments of various types unless those changes happen to fall
within the various stages of your deployment pipeline.

The second model in which you have classifications of changes that map to
parallel releases, the overhead of maintaining the deployment environment
branches is completely eliminated. It also models the actual situation with
respect to code and the natural requirements surrounding what needs to be done
with/to that code. Therefore, it requires no additional overhead or
maintenance.

### Conclusion

The above is why I believe the model in which branches parallel deployment
environments is costly and has no perceived value in comparison to its costs.
As always I am interested to hear peoples thoughts and opinions with respect to
my postings, so don't hesitate to share.
