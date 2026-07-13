# Exchange Trade Data Migration System

## Summary

The system migrates exchange trade data from legacy Oracle database into a PostgreSQL-based reporting database. It processes high-volume data using Spring Batch with chunk oriented processing, partitioninh, validation, retry/skip handling, staging, and reconciliation.

A seperate Vardin dashboard service provides operational visibility into executed pipelines, current and historical migration state, failed records, error rollups, reconciliation results, and final trade report. 