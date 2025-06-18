-- CreateTable
CREATE TABLE "Artists" (
    "id" INTEGER NOT NULL,
    "name" TEXT,
    "real_name" TEXT,
    "profile" TEXT,
    "data_quality" TEXT,
    "full_data" JSONB,

    CONSTRAINT "Artists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistUrls" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "url" TEXT,

    CONSTRAINT "ArtistUrls_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistAliases" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "alias_name" TEXT,

    CONSTRAINT "ArtistAliases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistNameVariations" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "variation" TEXT,

    CONSTRAINT "ArtistNameVariations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistMembers" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "member_name" TEXT,

    CONSTRAINT "ArtistMembers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistGroups" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "group_name" TEXT,

    CONSTRAINT "ArtistGroups_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ArtistUrls_artist_id_idx" ON "ArtistUrls"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistAliases_artist_id_idx" ON "ArtistAliases"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistNameVariations_artist_id_idx" ON "ArtistNameVariations"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistMembers_artist_id_idx" ON "ArtistMembers"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistGroups_artist_id_idx" ON "ArtistGroups"("artist_id");

-- AddForeignKey
ALTER TABLE "ArtistUrls" ADD CONSTRAINT "ArtistUrls_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistAliases" ADD CONSTRAINT "ArtistAliases_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistNameVariations" ADD CONSTRAINT "ArtistNameVariations_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistMembers" ADD CONSTRAINT "ArtistMembers_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistGroups" ADD CONSTRAINT "ArtistGroups_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE SET NULL ON UPDATE CASCADE;
