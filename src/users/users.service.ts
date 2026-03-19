import { Injectable } from '@nestjs/common';
import { users } from 'generated/prisma/client';
import { PrismaService } from 'src/prisma.service';

// This should be a real class/interface representing a user entity
export type User = any;

@Injectable()
export class UsersService {
    constructor(private prisma: PrismaService) { }

    async findOne(username: string): Promise<users | null> {
        return this.prisma.users.findUnique({
            where: { email: username },
        });
    }

    async create(username: string, password: string): Promise<users | null> {
        //TODO encriptar a senha
        return this.prisma.users.create({
            data: {
                id: crypto.randomUUID(),
                nickname: username,
                email: username,
                password_hash: password,
            },
        });
    }
}