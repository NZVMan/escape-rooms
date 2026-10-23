# Revision Escape Rooms (website)

The published maths, biology, chemistry and classical studies escape rooms, served by GitHub Pages. This folder only holds built games; the source for each lives in its own project folder next to this one (`Maths Escape Room`, `Biology Escape Room`, `Chemistry Escape Room`, `Classics Escape Room`).

- `index.html` is the home page that links to each subject and explains Add to Home Screen.
- `maths/`, `biology/`, `chemistry/`, `classics/` are each a separate installable web app (made by `node tools/build.mjs --web` in that project). Do not edit them here; they are replaced on every publish.

## Updating the website

After changing any of the games, run from this folder:

```
./publish.sh
```

It rebuilds all four web apps, copies them here, commits and pushes. Use `./publish.sh --no-push` to rebuild without publishing.
