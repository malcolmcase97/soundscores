-- CreateTable
CREATE TABLE "artists" (
    "id" INTEGER NOT NULL,
    "name" TEXT,
    "real_name" TEXT,
    "profile" TEXT,
    "data_quality" TEXT,
    "full_data" JSONB,

    CONSTRAINT "artists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist_urls" (
    "artist_id" INTEGER,
    "url" TEXT,
    "id" SERIAL NOT NULL,

    CONSTRAINT "artist_urls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist_aliases" (
    "artist_id" INTEGER,
    "alias_name" TEXT,
    "id" SERIAL NOT NULL,

    CONSTRAINT "artist_aliases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist_name_variations" (
    "artist_id" INTEGER,
    "variation" TEXT,
    "id" SERIAL NOT NULL,

    CONSTRAINT "artist_name_variations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist_members" (
    "artist_id" INTEGER,
    "member_name" TEXT,
    "id" SERIAL NOT NULL,

    CONSTRAINT "artist_members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "artist_groups" (
    "artist_id" INTEGER,
    "group_name" TEXT,
    "id" SERIAL NOT NULL,

    CONSTRAINT "artist_groups_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "artist_urls" ADD CONSTRAINT "artist_urls_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "artist_aliases" ADD CONSTRAINT "artist_aliases_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "artist_name_variations" ADD CONSTRAINT "artist_name_variations_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "artist_members" ADD CONSTRAINT "artist_members_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "artist_groups" ADD CONSTRAINT "artist_groups_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

