+++
title = "Internet Relay Chat (IRC) with Screen Multiplexer"
date = "2020-01-26T12:17:38-05:00"
draft = false
math = true
tags = ["terminal", "irc", "linux"]
summary = """
Internet Relay Chat is a protocol for facilitating
"""
+++

# Internet Relay Chat and Screen

Internet Relay Chat (IRC) hs been around since 1988 and was created by [Jarkko Oikarinen](https://en.wikipedia.org/wiki/Jarkko_Oikarinen).

IRC was borne out of the need to have a real time communication system while using an operating system to communicate with other users.

IRC is an open protocol that uses Transmission Control Protocol (TCP). 

You can read more about IRC in the official [Internet Relay Chat Protocol RFC 1459](https://tools.ietf.org/html/rfc1459).

During an IRC session, client will send 1 line messages to a server.

I am mostly a terminal user so my ideal irc client would be terminal based.

## IRSSI

IRSSI is an IRC client that you can use in Linux, Mac and Windows.

Since I primarily work in Mac OS X I will show how I setup IRSSI on the Mac but you can find you particular install and setup directions at [irssi.org/download](https://irssi.org/download/) official website.

#### IRSSI Mac Setup

Now with that let us get irssi up and running in a terminal environment.

If you have [Homebrew](https://brew.sh/) installed you can install irssi in one command like this:

{{< highlight bash >}}
brew install irssi
{{< / highlight >}}

I already have irssi installed in my Macbook Pro as you can tell:

{{< figure src="/media/homebrew-irssi.png" >}}


## Starting an IRSSI session

You can simply type `irssi` in a terminal session after installing irssi and you will see a screen like this:

{{< figure src="/media/irssi-basic-session.png" >}}

Notice that we are being prompted for a `status` since we haven't really connected to anything yet.

#### Starting a screen session 

Instead of simply typing in `irssi` in a terminal let us first start a screen session.

`Screen` is a terminal multiplexer that has been around for a long time like over 30 years and has many possible uses.

The nice thing about using screen with irssi is that we can keep a long running session that won't be interrupted if we decide to logoff of our current computer session and we can detach it for later use.

With that being said if you are already on a mac then you will already have it installed most probably.

We can kill our current irssi session by simply typing `/exit` or `/EXIT` in the status prompt in the bottom.

Let us create a new screen session like this:

{{< highlight bash >}}
screen -S irc-chat
{{< / highlight >}}

We named our screen session `irc-chat` 

Now we will simply type in `irssi` like we did before except we now have a screen session running as well.

## Connecting to a network

In order for us to do anything useful we need to connect to an actual IRC Network.

For the purposes of this blog post we will connect to the Mozilla IRC Server of `irc.mozilla.org`.

#### Using the /help in irssi

You can use the `/help` command in irssi to understand each command and by the way each command begins with the `/` character in an irssi session.

Let us connect to the `irc.mozilla.org` irc server with the following command:

{{< highlight bash >}}
/connnect irc.mozilla.org
{{< / highlight >}}

Once connected you will see a screen like this:

{{< figure src="/media/irssi-irc-server-connect.png" >}}

We can type the following command to see a list of all available Channels in the particular IRC Server we are connected to:

{{< highlight bash >}}
/LIST -YES
{{< / highlight >}}

Notice that we put `-YES` after our command because of a particular warning prompt you get with the `/LIST` command

{{< figure src="/media/channels-irc.png" >}}

## Connecting to Rust 

Since we are in a screen session we need to type in `Control Character A then [` or `C-a [` so that we can scroll back and look at channels.

#### Reading help menu for `/channel` command

Let us read some help documentation for the `/channel` command:

{{< figure src="/media/irssi-channel-help.png" >}}

There is quite a bit of options but we will simply type in:

{{< highlight bash >}}
/join #rust-servo
{{< / highlight >}}

To join the `#rust-servo` channel.

Now that we have joined we should see a session like this:

{{< figure src="/media/irssi-channel-appear.png" >}}

## Setting a nickname

You can set a nickname by typing in:

{{< highlight bash >}}
/set nick <nick_name>
{{< / highlight >}}

We can leave an IRC channel by simply typing in `/leave` and we will leave the channel.

## List names of current users in channel

We can see a list of current users in a channel by typing in 

{{< highlight bash >}}
/names
{{< / highlight >}}

You will see a screen like this:

{{< figure src="/media/irssi-names.png" >}}

You won't see any information about the user until you exit the channel so don't be alarmed:

{{< figure src="/media/irssi-whois.png" >}}

## Private Messenging

You can privately message a user by using there nickname like this:

{{< highlight bash >}}
/msg comey Hello There My friend!
{{< / highlight >}}

## Leaving an IRC Server

We can simply type in:

{{< highlight bash >}}
/quit
{{< / highlight >}}

to leave the IRC Server.

## Detach screen session

Remember that we created a screen session if we want to detach from our current running session we simply type:

{{< highlight bash >}}
Ctrl+a d
{{< / highlight >}}

## Listing screen session

If we don't remember what we called our screen session then we can simply type in:

{{< highlight bash >}}
screen -ls
{{< / highlight >}}

and we will see something like this in the terminal:

{{< figure src="/media/screen-session-list.png" >}}

## Reattaching a Screen session

We can simply type in:

{{< highlight bash >}}
screen -r irc-chat
{{< / highlight >}}

and we will be reattached to our previous irc session:

{{< figure src="/media/screen-irssi-attach.png" >}}

There is much more you can do with irssi/screen than I have mentioned here and I would suggest trying it out on your own.

## Twitter & Github Account

Please follow me at [jbelmont @ github](https://github.com/jbelmont) and [jbelmont80 @ twitter](https://twitter.com/jbelmont80)

Feel free to leave a comment if you like.

Until Next Time :)