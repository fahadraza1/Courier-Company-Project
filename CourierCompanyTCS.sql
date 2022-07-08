
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/08/2022 05:06:46
-- Generated from EDMX file: E:\Github\Coding Basics\Assignment1\EcomerceStore\EcomerceStore\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CourierCompanyTCS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustId] int IDENTITY(1,1) NOT NULL,
    [CustName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Consignments'
CREATE TABLE [dbo].[Consignments] (
    [ConsignNo] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Weight] int  NOT NULL,
    [CustomerId] int  NOT NULL,
    [Destination_Id] int  NOT NULL,
    [Tracking_Id] int  NOT NULL
);
GO

-- Creating table 'Destinations'
CREATE TABLE [dbo].[Destinations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [HouseNumber] nvarchar(max)  NOT NULL,
    [Tracking_Id] int  NOT NULL
);
GO

-- Creating table 'Trackings'
CREATE TABLE [dbo].[Trackings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId] int  NOT NULL,
    [ConsignNo] nvarchar(max)  NOT NULL,
    [CustName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustId] ASC);
GO

-- Creating primary key on [ConsignNo] in table 'Consignments'
ALTER TABLE [dbo].[Consignments]
ADD CONSTRAINT [PK_Consignments]
    PRIMARY KEY CLUSTERED ([ConsignNo] ASC);
GO

-- Creating primary key on [Id] in table 'Destinations'
ALTER TABLE [dbo].[Destinations]
ADD CONSTRAINT [PK_Destinations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Trackings'
ALTER TABLE [dbo].[Trackings]
ADD CONSTRAINT [PK_Trackings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'Consignments'
ALTER TABLE [dbo].[Consignments]
ADD CONSTRAINT [FK_CustomerConsignment]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerConsignment'
CREATE INDEX [IX_FK_CustomerConsignment]
ON [dbo].[Consignments]
    ([CustomerId]);
GO

-- Creating foreign key on [Destination_Id] in table 'Consignments'
ALTER TABLE [dbo].[Consignments]
ADD CONSTRAINT [FK_ConsignmentDestination]
    FOREIGN KEY ([Destination_Id])
    REFERENCES [dbo].[Destinations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConsignmentDestination'
CREATE INDEX [IX_FK_ConsignmentDestination]
ON [dbo].[Consignments]
    ([Destination_Id]);
GO

-- Creating foreign key on [CustomerId] in table 'Trackings'
ALTER TABLE [dbo].[Trackings]
ADD CONSTRAINT [FK_CustomerTracking]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerTracking'
CREATE INDEX [IX_FK_CustomerTracking]
ON [dbo].[Trackings]
    ([CustomerId]);
GO

-- Creating foreign key on [Tracking_Id] in table 'Destinations'
ALTER TABLE [dbo].[Destinations]
ADD CONSTRAINT [FK_DestinationTracking]
    FOREIGN KEY ([Tracking_Id])
    REFERENCES [dbo].[Trackings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DestinationTracking'
CREATE INDEX [IX_FK_DestinationTracking]
ON [dbo].[Destinations]
    ([Tracking_Id]);
GO

-- Creating foreign key on [Tracking_Id] in table 'Consignments'
ALTER TABLE [dbo].[Consignments]
ADD CONSTRAINT [FK_ConsignmentTracking]
    FOREIGN KEY ([Tracking_Id])
    REFERENCES [dbo].[Trackings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConsignmentTracking'
CREATE INDEX [IX_FK_ConsignmentTracking]
ON [dbo].[Consignments]
    ([Tracking_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------