# Gifrap

We *live* on the internet (let's be real).

To be fluent in "internet", you need text, and emoji, and ... memes! To have those, we need _the animated gif_.

So, in service of having fun, and owning our media and images, let's build ourselves our own database of meme goodness.

_Gifrap_ is a self-hosted repository of animated gifs, and jpgs, etc.

## Stack

* Rails 7.x
* Postgresql
* Rspec (factory_bot, cuprite, capybara)
* GoodJob
* Vite (w/vite_ruby)
* TailwindCSS
* StimulusJS

## Set Up

Run `bin/setup` to:

1. Create database
2. Seed database
3. Run the test suite

## Features

![Building](https://media.tenor.com/gBlnBO1ov9YAAAAM/hammer-tools.gif)

This is currently pre-alpha software - well in the throes of early development.

Below is the breakdown of features being built along with a couple of milestones.

## Alpha

- [x] Generate temporary "visitor" user
- [x] Generate models and create controller skeleton
- [x] Upload image via web browser
    - [x] Integration with Shubox
- [ ] Rough layout and UI
    - [ ] Nav
    - [ ] Flash messages
    - [ ] Upload and new image modal
    - [ ] Masonry layout of images
- [ ] `Images#show`
    - [ ] click to copy URL
- [ ] `Images#edit`
    - [ ] Add tags to image
    - [ ] Add descriptions to image. (Allows for future retrieval of image via a phrase or file name -- matching "mark-cuban-taking-notes.gif" OR "taking-notes.gif" to the proper image)
- [ ] No account(s)/users. Log-in via email.

## Beta

- [ ] Convert gif to webm and mp4 (smaller files)
- [ ] Extract frame of gif to jpg/webp/avif
- [x] Upload via URL
- [ ] `Images#index`
    - [ ] blur/obfuscate "nsfw" images
- [ ] `Images#show`
    - [ ] display tags
    - [ ] fav image
- [ ] `Images#edit`
    - [ ] Tag image as "nsfw"
- [ ] Search for image(s)
    - [ ] Search by tags and descriptions
    - [ ] Order by owner (show me mine first), then others.
    - [ ]

## v1.0

- [ ] Containerize/Dockerize each version, push to docker-hub
    - [ ] Example docker-compose setup in README

## v2.0

- [ ] Slack bot. Respond to a message containing a string like "taking-notes.gif" and responding with the correct image.

### Finally

![tttthhhhank you](https://c.tenor.com/K-NT5HJdVzoAAAAC/tenor.gif)

