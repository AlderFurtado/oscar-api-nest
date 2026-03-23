import { ApiProperty } from '@nestjs/swagger';

export class AuthRegisterDto {
    @ApiProperty({ example: 'johndoe', description: 'User unique username or email' })
    username: string

    @ApiProperty({ example: 'strongP@ssw0rd', description: 'Plain-text password (will be hashed on server)' })
    password: string
}