import { getCustomer, getCustomers} from './db.js';

// Resolvers define how to fetch the types defined in your schema.
// This resolver retrieves books from the "books" array above.
export const resolvers = {
  Query: {
    customers: () => getCustomers(),
    customer: (_: any, args: any) => getCustomer(args.customer_id)
  },
};
