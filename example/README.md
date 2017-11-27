# Example presentation

An example presentation written in Markdown and DOT.

## Usage

To watch the current directory and build the presentation whenever a change
occurs

`docker run -tv "$PWD:/volume" adarnimrod/presentation`

To build the presentation and exit

`docker run -tv "$PWD:/volume" adarnimrod/presentation make`
