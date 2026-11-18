import { withSupabase } from "npm:@supabase/server@1";

export default {
    fetch: withSupabase({ auth: "user" }, async (_req, ctx) => {
        // ctx.supabase aplica las politicas RLS del usuario autenticado
        const { data, error } = await ctx.supabase
            .from("exercises")
            .select("type, duration_minutes");

        if (error) {
            return Response.json(
                { error: error.message },
                { status: 400 },
            );
        }

        // Agrupar ejercicios por tipo y sumar minutos totales en la nube
        const porTipo = {};
        let totalMinutos = 0;

        for (const ejercicio of data) {
            const tipo = ejercicio.type ?? "Sin tipo";
            const minutos = ejercicio.duration_minutes ?? 0;

            porTipo[tipo] = (porTipo[tipo] ?? 0) + 1;
            totalMinutos += minutos;
        }

        return Response.json({
            totalEjercicios: data.length,
            totalMinutos,
            porTipo,
        });
    }),
};
