module Activity.Record exposing (all)

import Activity.Data.Year2018.October
import Activity.Model exposing (Activity)


all : List Activity
all =
    List.concat
        [ Activity.Data.Year2018.October.activities
        ]
