<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210217100419 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE room ADD city VARCHAR(255) NOT NULL, ADD floor INT NOT NULL, ADD has_projector TINYINT(1) NOT NULL, ADD is_available TINYINT(1) NOT NULL, ADD has_internet TINYINT(1) NOT NULL, ADD address VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE room DROP city, DROP floor, DROP has_projector, DROP is_available, DROP has_internet, DROP address');
    }
}
