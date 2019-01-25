# Wildfestival Groningen 2019 #WFG

A website for a beer festival dedicated to spontaneously, wild fermentation.
Expect a great line-up with fantastic beer (and other wild drinks) and delicious food.

Saturday the 23th of November 2019 @ EM2 Groningen, The Netherlands

This website is built with [Middleman](https://middlemanapp.com/) and [Middleman Template by ThoughtBot](https://github.com/thoughtbot/middleman-template) and is multilanguage ready.

## Setup

After you have cloned this repo, follow these steps to run the website:

-   Run the setup script to set up your machine with the necessary dependencies:

    ```bash
    bin/setup
    ```

-   Start the Middleman server:

    ```bash
    rake serve
    ```

    You should now be able to view your website at <http://localhost:4567>.

-   Build

    ```bash
    rake build
    ```

    You should now see an attempt to a clean build.

-   Test

    ```bash
    rake test
    ```

    You should now see an attempt to a verbose build with a test with html-proofer right after
