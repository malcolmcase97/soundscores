-- CreateTable
CREATE TABLE "Releases" (
    "id" INTEGER NOT NULL,
    "master_id" INTEGER,
    "title" TEXT,
    "country" TEXT,
    "released_date" TEXT,
    "notes" TEXT,
    "data_quality" TEXT,
    "full_data" JSONB,

    CONSTRAINT "Releases_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseArtists" (
    "release_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,
    "role" TEXT,

    CONSTRAINT "ReleaseArtists_pkey" PRIMARY KEY ("release_id","artist_id")
);

-- CreateTable
CREATE TABLE "ReleaseExtraArtists" (
    "release_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,
    "anv" TEXT,
    "role" TEXT,

    CONSTRAINT "ReleaseExtraArtists_pkey" PRIMARY KEY ("release_id","artist_id")
);

-- CreateTable
CREATE TABLE "ReleaseGenres" (
    "release_id" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,

    CONSTRAINT "ReleaseGenres_pkey" PRIMARY KEY ("release_id","genre")
);

-- CreateTable
CREATE TABLE "ReleaseStyles" (
    "release_id" INTEGER NOT NULL,
    "style" TEXT NOT NULL,

    CONSTRAINT "ReleaseStyles_pkey" PRIMARY KEY ("release_id","style")
);

-- CreateTable
CREATE TABLE "ReleaseFormats" (
    "id" SERIAL NOT NULL,
    "release_id" INTEGER NOT NULL,
    "format_desc" TEXT,

    CONSTRAINT "ReleaseFormats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseVideos" (
    "id" SERIAL NOT NULL,
    "release_id" INTEGER NOT NULL,
    "title" TEXT,
    "description" TEXT,

    CONSTRAINT "ReleaseVideos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReleaseTracklist" (
    "track_id" SERIAL NOT NULL,
    "release_id" INTEGER NOT NULL,
    "position" TEXT,
    "title" TEXT,
    "duration" TEXT,

    CONSTRAINT "ReleaseTracklist_pkey" PRIMARY KEY ("track_id")
);

-- CreateTable
CREATE TABLE "TrackExtraArtists" (
    "release_id" INTEGER NOT NULL,
    "track_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,
    "name" TEXT,
    "anv" TEXT,
    "role" TEXT,

    CONSTRAINT "TrackExtraArtists_pkey" PRIMARY KEY ("release_id","track_id","artist_id")
);

-- CreateTable
CREATE TABLE "ReleaseLabels" (
    "release_id" INTEGER NOT NULL,
    "label_id" INTEGER NOT NULL,

    CONSTRAINT "ReleaseLabels_pkey" PRIMARY KEY ("release_id","label_id")
);

-- CreateTable
CREATE TABLE "ReleaseCompanies" (
    "release_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "role" TEXT,

    CONSTRAINT "ReleaseCompanies_pkey" PRIMARY KEY ("release_id","company_id")
);

-- CreateTable
CREATE TABLE "ReleaseIdentifiers" (
    "id" SERIAL NOT NULL,
    "release_id" INTEGER NOT NULL,
    "type" TEXT,
    "value" TEXT,

    CONSTRAINT "ReleaseIdentifiers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ReleaseArtists_artist_id_idx" ON "ReleaseArtists"("artist_id");

-- CreateIndex
CREATE INDEX "ReleaseExtraArtists_artist_id_idx" ON "ReleaseExtraArtists"("artist_id");

-- CreateIndex
CREATE INDEX "ReleaseGenres_genre_idx" ON "ReleaseGenres"("genre");

-- CreateIndex
CREATE INDEX "ReleaseStyles_style_idx" ON "ReleaseStyles"("style");

-- CreateIndex
CREATE INDEX "ReleaseFormats_release_id_idx" ON "ReleaseFormats"("release_id");

-- CreateIndex
CREATE INDEX "ReleaseVideos_release_id_idx" ON "ReleaseVideos"("release_id");

-- CreateIndex
CREATE INDEX "ReleaseTracklist_release_id_idx" ON "ReleaseTracklist"("release_id");

-- CreateIndex
CREATE INDEX "TrackExtraArtists_track_id_idx" ON "TrackExtraArtists"("track_id");

-- CreateIndex
CREATE INDEX "TrackExtraArtists_artist_id_idx" ON "TrackExtraArtists"("artist_id");

-- CreateIndex
CREATE INDEX "ReleaseIdentifiers_release_id_idx" ON "ReleaseIdentifiers"("release_id");

-- AddForeignKey
ALTER TABLE "ReleaseArtists" ADD CONSTRAINT "ReleaseArtists_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseArtists" ADD CONSTRAINT "ReleaseArtists_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseExtraArtists" ADD CONSTRAINT "ReleaseExtraArtists_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseExtraArtists" ADD CONSTRAINT "ReleaseExtraArtists_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseGenres" ADD CONSTRAINT "ReleaseGenres_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseStyles" ADD CONSTRAINT "ReleaseStyles_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseFormats" ADD CONSTRAINT "ReleaseFormats_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseVideos" ADD CONSTRAINT "ReleaseVideos_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseTracklist" ADD CONSTRAINT "ReleaseTracklist_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrackExtraArtists" ADD CONSTRAINT "TrackExtraArtists_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrackExtraArtists" ADD CONSTRAINT "TrackExtraArtists_track_id_fkey" FOREIGN KEY ("track_id") REFERENCES "ReleaseTracklist"("track_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrackExtraArtists" ADD CONSTRAINT "TrackExtraArtists_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseLabels" ADD CONSTRAINT "ReleaseLabels_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseCompanies" ADD CONSTRAINT "ReleaseCompanies_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleaseIdentifiers" ADD CONSTRAINT "ReleaseIdentifiers_release_id_fkey" FOREIGN KEY ("release_id") REFERENCES "Releases"("id") ON DELETE CASCADE ON UPDATE CASCADE;
