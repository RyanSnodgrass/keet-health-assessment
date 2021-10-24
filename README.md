# Readme

## Quickstart

1. `docker build -t keet .`
2. To run app: `docker run keet ruby time_service.rb`
3. To run unittests: `docker run keet ruby test_time_service.rb`

I tend to use git like another file save. Commit small and frequently. This can
get me in trouble if I'm in a project with heavy rebasing teammates. So I'll
generally clean up and squash the commits before I open a PR for the branch I'm on.

For small projects like this, I personally commit to master for a couple commits
before I find a need to checkout a new branch. For this assessment, I'm going to
pretend like this is a big production project and branch off early.

For this project I'm going to stick with Minitest. I've been using it a lot lately
and I like its simplicity and speed. Plus it is very similar to Python's Unittest
library.

## Refactor Thoughts
- This seems like a good candidate to turn into a gem. Then it would make a bit more sense
to have the 2 subclasses.
- The AM/PM string is currently hard coded to return AM. Refactor the `#knock_off_ampm`
method to save it. Probably would save it as an instance variable `@ampm` and then reference
it later in the `add_minutes` return string like so: `"#{hours}:#{minutes} #{@ampm}"`
- It doesn't handle 12 hour time as input right now. If you were to ask to add minutes to
an afternoon timestamp, it would still return a morning time. With the `@ampm`
instance variable saved, I would fix that by adding 720 (12 * 60) to the
`minutes_since_midnight` function when 'PM'.
- Relatedly, it doesn't handle 12 hour time as output either.
- It also doesn't handle rolling over to the next day. Don't check if
`total_time > 1440` cause that doesn't handle multiple days. Instead use
    ```ruby
    total_time = 1550
    r = total_time.divmod(1440)  # [1, 110]
    total_time = r[1]
    ```
    - Then use the division remainder 110 as the minutes_since_midnight and convert that
to human readable timestamp.
- During unittests it outputs "9:23 AM" in the beginning for every run. I'm not
loading the module correctly.
- If a timestamp output ends with 0, like 5:30, then it currently outputs "5:3 AM".
That needs to be fixed.
