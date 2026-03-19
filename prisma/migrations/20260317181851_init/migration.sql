-- CreateTable
CREATE TABLE "categories" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "sequence_order" INTEGER DEFAULT 0,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movies" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "movies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "nominees" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "movie_id" UUID NOT NULL,
    "category_id" UUID NOT NULL,
    "nominee_name" TEXT,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "url_image" TEXT DEFAULT 'https://s2-gshow.glbimg.com/KIfsgPzVx8g-zWDxOSGy4llwWLw=/0x0:1080x1182/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_e84042ef78cb4708aeebdf1c68c6cbd6/internal_photos/bs/2026/y/S/gpOY25TAizQq9IcyUHeg/theacademy-20260102-150058-1663833045.jpg',

    CONSTRAINT "nominees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schema_migrations" (
    "version" TEXT NOT NULL,
    "applied_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "nickname" TEXT NOT NULL,
    "bio" TEXT,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "role" VARCHAR(20) DEFAULT 'user',

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "votes" (
    "id" SERIAL NOT NULL,
    "user_id" UUID NOT NULL,
    "nominated_id" UUID NOT NULL,
    "category_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "votes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "winners" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "nominated_id" UUID NOT NULL,
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "winners_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "categories_name_unique" ON "categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "movies_title_unique" ON "movies"("title");

-- CreateIndex
CREATE UNIQUE INDEX "nominees_movie_id_category_id_nominee_name_key" ON "nominees"("movie_id", "category_id", "nominee_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "votes_user_id_category_id_key" ON "votes"("user_id", "category_id");

-- CreateIndex
CREATE UNIQUE INDEX "winners_nominated_id_key" ON "winners"("nominated_id");

-- AddForeignKey
ALTER TABLE "nominees" ADD CONSTRAINT "fk_nominees_category" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "nominees" ADD CONSTRAINT "fk_nominees_movie" FOREIGN KEY ("movie_id") REFERENCES "movies"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_nominated_id_fkey" FOREIGN KEY ("nominated_id") REFERENCES "nominees"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "votes" ADD CONSTRAINT "votes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "winners" ADD CONSTRAINT "winners_nominated_id_fkey" FOREIGN KEY ("nominated_id") REFERENCES "nominees"("id") ON DELETE CASCADE ON UPDATE NO ACTION;
