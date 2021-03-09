use Mix.Config
config :votes, Votes.Repo,
        host: "127.0.0.1",
        port: 5432,
        database: "votes",
        username: "roslan",
        password: "ramblingros",
        pool_size: 10


config :votes, VotesWeb.Endpoint,
        server: true,
        http: [port: 4000, transport_options: [sockets_opts: [:inet6]]],
        check_origin: [
                "https://undionline.com",
                "http://undionline.com:4000"
        ],
        secret_key_base: "2b2InLRoj+ywaPXfMc8Ik52+EHuqCHSuGH0LOPq7V1mahID3tKINefHvWRmkfMVE"
