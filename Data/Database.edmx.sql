
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/15/2016 09:26:08
-- Generated from EDMX file: C:\Users\klaho\OneDrive\Documents\Projects\TehnologiiWeb\FaceMaze\Data\Database.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FaceMaze];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_IdentityUserLogin_string__ApplicationUser_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_IdentityUserLogin_string__ApplicationUser_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_HighScoreUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HighScoresSet] DROP CONSTRAINT [FK_HighScoreUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_Friends]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUsers] DROP CONSTRAINT [FK_Friends];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[HighScoresSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HighScoresSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserLogins'
CREATE TABLE [dbo].[UserLogins] (
    [LoginProvider] nvarchar(450)  NOT NULL,
    [ProviderKey] nvarchar(450)  NOT NULL,
    [ProviderDisplayName] nvarchar(max)  NULL,
    [UserId] nvarchar(450)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] nvarchar(450)  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [UserName] nvarchar(256)  NULL,
    [ProfilePicUrl] nvarchar(max)  NOT NULL,
    [Friends_User1_Id] nvarchar(450)  NULL
);
GO

-- Creating table 'HighScores'
CREATE TABLE [dbo].[HighScores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(450)  NOT NULL,
    [Score] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [LoginProvider], [ProviderKey] in table 'UserLogins'
ALTER TABLE [dbo].[UserLogins]
ADD CONSTRAINT [PK_UserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'HighScores'
ALTER TABLE [dbo].[HighScores]
ADD CONSTRAINT [PK_HighScores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'UserLogins'
ALTER TABLE [dbo].[UserLogins]
ADD CONSTRAINT [FK_IdentityUserLogin_string__ApplicationUser_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_IdentityUserLogin_string__ApplicationUser_UserId'
CREATE INDEX [IX_FK_IdentityUserLogin_string__ApplicationUser_UserId]
ON [dbo].[UserLogins]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'HighScores'
ALTER TABLE [dbo].[HighScores]
ADD CONSTRAINT [FK_HighScoreUsers]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HighScoreUsers'
CREATE INDEX [IX_FK_HighScoreUsers]
ON [dbo].[HighScores]
    ([UserId]);
GO

-- Creating foreign key on [Friends_User1_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Friends]
    FOREIGN KEY ([Friends_User1_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Friends'
CREATE INDEX [IX_FK_Friends]
ON [dbo].[Users]
    ([Friends_User1_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------