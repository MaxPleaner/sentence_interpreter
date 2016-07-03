## How to run:

This file can be run from the command line.

```shell
ruby sentence_interpreter.rb <sentence>
```

#### Rules

- Nouns must have a preceeding verb
- When a verb is found, it becomes the 'verb' for the phrase and the rest
  of the nouns (until the next verb) become the nouns of the phrase
- `nouns` and `verbs` are defined as those included in `lexicon/`. All other words will be ignored.

#### Examples

```shell
Sentence="search google for roses"
ruby sentence_interpreter $Sentence
```

The sentence will be parsed into all Verb Noun phrases
given the definitions provided in lexicon/

Because of the verb-first rule, `"Visit website gmail"` is fine
but `"gmail visit"` is not ok.

`"Visit gmail inbox and visit Github inbox"` would be a valid example of a sentence with two Verb Noun phrases. The results would be:

```ruby
   [
     { verb: "visit", nouns: ["gmail", "inbox"] },
     { verb: "visit", nouns: ["github", "inbox"]
   ]
```

The script will output this in JSON stringified form.