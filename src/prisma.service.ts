
import { Injectable } from '@nestjs/common';
import { PrismaPg } from '@prisma/adapter-pg'
import { PrismaClient } from 'generated/prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  constructor() {
    const adapter = new PrismaPg({
      host: "localhost",
      port: 5432,
      user: "postgres",
      password: "postgres",
      database: "moviesdb"
    });
    super({ adapter });
  }
}
