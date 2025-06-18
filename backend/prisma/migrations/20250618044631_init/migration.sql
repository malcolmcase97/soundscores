-- CreateTable
CREATE TABLE "Artist" (
    "id" INTEGER NOT NULL,
    "name" TEXT,
    "real_name" TEXT,
    "profile" TEXT,
    "data_quality" TEXT,
    "full_data" JSONB,

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistUrl" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "url" TEXT,

    CONSTRAINT "ArtistUrl_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistAlias" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "alias_name" TEXT,

    CONSTRAINT "ArtistAlias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistNameVariation" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "variation" TEXT,

    CONSTRAINT "ArtistNameVariation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistMember" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "member_name" TEXT,

    CONSTRAINT "ArtistMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArtistGroup" (
    "id" SERIAL NOT NULL,
    "artist_id" INTEGER,
    "group_name" TEXT,

    CONSTRAINT "ArtistGroup_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ArtistUrl_artist_id_idx" ON "ArtistUrl"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistAlias_artist_id_idx" ON "ArtistAlias"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistNameVariation_artist_id_idx" ON "ArtistNameVariation"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistMember_artist_id_idx" ON "ArtistMember"("artist_id");

-- CreateIndex
CREATE INDEX "ArtistGroup_artist_id_idx" ON "ArtistGroup"("artist_id");

-- AddForeignKey
ALTER TABLE "ArtistUrl" ADD CONSTRAINT "ArtistUrl_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistAlias" ADD CONSTRAINT "ArtistAlias_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistNameVariation" ADD CONSTRAINT "ArtistNameVariation_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistMember" ADD CONSTRAINT "ArtistMember_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArtistGroup" ADD CONSTRAINT "ArtistGroup_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artist"("id") ON DELETE SET NULL ON UPDATE CASCADE;
