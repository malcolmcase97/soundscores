-- CreateTable
CREATE TABLE "Masters" (
    "id" INTEGER NOT NULL,
    "title" TEXT,
    "year" INTEGER,
    "main_release" INTEGER,
    "data_quality" TEXT,
    "full_data" JSONB,

    CONSTRAINT "Masters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MasterArtists" (
    "master_id" INTEGER NOT NULL,
    "artist_id" INTEGER NOT NULL,
    "join_phrase" TEXT,
    "anv" TEXT,

    CONSTRAINT "MasterArtists_pkey" PRIMARY KEY ("master_id","artist_id")
);

-- CreateTable
CREATE TABLE "MasterGenres" (
    "master_id" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,

    CONSTRAINT "MasterGenres_pkey" PRIMARY KEY ("master_id","genre")
);

-- CreateTable
CREATE TABLE "MasterStyles" (
    "master_id" INTEGER NOT NULL,
    "style" TEXT NOT NULL,

    CONSTRAINT "MasterStyles_pkey" PRIMARY KEY ("master_id","style")
);

-- CreateTable
CREATE TABLE "MasterVideos" (
    "id" SERIAL NOT NULL,
    "master_id" INTEGER NOT NULL,
    "title" TEXT,
    "description" TEXT,

    CONSTRAINT "MasterVideos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Masters_main_release_idx" ON "Masters"("main_release");

-- CreateIndex
CREATE INDEX "MasterArtists_artist_id_idx" ON "MasterArtists"("artist_id");

-- CreateIndex
CREATE INDEX "MasterGenres_genre_idx" ON "MasterGenres"("genre");

-- CreateIndex
CREATE INDEX "MasterStyles_style_idx" ON "MasterStyles"("style");

-- CreateIndex
CREATE INDEX "MasterVideos_master_id_idx" ON "MasterVideos"("master_id");

-- AddForeignKey
ALTER TABLE "MasterArtists" ADD CONSTRAINT "MasterArtists_master_id_fkey" FOREIGN KEY ("master_id") REFERENCES "Masters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MasterArtists" ADD CONSTRAINT "MasterArtists_artist_id_fkey" FOREIGN KEY ("artist_id") REFERENCES "Artists"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MasterGenres" ADD CONSTRAINT "MasterGenres_master_id_fkey" FOREIGN KEY ("master_id") REFERENCES "Masters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MasterStyles" ADD CONSTRAINT "MasterStyles_master_id_fkey" FOREIGN KEY ("master_id") REFERENCES "Masters"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MasterVideos" ADD CONSTRAINT "MasterVideos_master_id_fkey" FOREIGN KEY ("master_id") REFERENCES "Masters"("id") ON DELETE CASCADE ON UPDATE CASCADE;
